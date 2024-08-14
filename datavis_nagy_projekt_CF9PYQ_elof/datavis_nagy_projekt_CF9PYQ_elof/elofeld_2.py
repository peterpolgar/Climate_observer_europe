from os import listdir
from os.path import isfile, join

the_data = []
with open('city_data.txt') as cd:
    read_data = cd.readlines()
    for line in read_data:
        if line[-1] == '\n':
            line = line[:-1]
        if line != '':
            elems = line.split(';')
            the_data.append( elems )

filenames = [f for f in listdir("./in_csv") if isfile(join("./in_csv/", f))]

months = [[31] * 48, [28, 28, 28, 29, 28, 28, 28, 29, 28, 28, 28, 29, 28, 28, 28, 29, 28, 28, 28, 29, 28, 28, 28, 29, 28, 28, 28, 29, 28, 28, 28, 29, 28, 28, 28, 29, 28, 28, 28, 29, 28, 28, 28, 29, 28, 28, 28, 29], [31] * 48, [30] * 48, [31] * 48, [30] * 48, [31] * 48, [31] * 48, [30] * 48, [31] * 48, [30] * 48, [31] * 48]

for fname in filenames:
    with open("./in_csv/" + fname) as fajl:
        fajl.readline()
        content = fajl.readline()
        if content[-1] == '\n':
            content = content[:-1]
        elsosor = content.split(',')
        for i in range(len(elsosor)):
            elsosor[i] = elsosor[i][1:-1]
        foundidx = 0
        for i in range(len(the_data)):
            if int(the_data[i][0][:6]) == int(elsosor[0][:6]):
                foundidx = i
                break
        with open("./formatted_csv/for_" + fname, "w") as ki:
            orist = elsosor[4].split('-')
            exp_year = int(orist[0]); exp_month = int(orist[1]); exp_day = int(orist[2]);
            content = [content]
            content.extend(fajl.readlines())
            ki.write(the_data[foundidx][5] + ";" + str(foundidx) + ";" + '{:.2f}'.format(float(elsosor[1])) + ";" + '{:.3f}'.format(float(elsosor[2])) + ";" + '{:.0f}'.format(float(elsosor[3])) + ";" + the_data[foundidx][1] + ";" + the_data[foundidx][2] + ";" + elsosor[4] + ";" + content[-1].split(',')[4][1:-1] + ";" + the_data[foundidx][6] + '\n')
            
            for line in content:
                if line[-1] == '\n':
                    line = line[:-1]
                if line == '':
                    continue
                elems = line.split(',')
                for i in range(4, len(elems)):
                    elems[i] = elems[i][1:-1]
                
                stmp = elems[4].split('-')
                act_year = int(stmp[0]); act_month = int(stmp[1]); act_day = int(stmp[2])
                while act_year != exp_year or act_month != exp_month or act_day != exp_day:
                    ki.write('000000;99;99;99;99;-1;-1;-1;-1;-1;-1;-1;-1\n')
                    exp_day += 1
                    if exp_day > months[exp_month - 1][exp_year - 1973]:
                        exp_day = 1
                        exp_month += 1
                        if exp_month == 13:
                            exp_month = 1
                            exp_year += 1
                exp_day += 1
                if exp_day > months[exp_month - 1][exp_year - 1973]:
                    exp_day = 1
                    exp_month += 1
                    if exp_month == 13:
                        exp_month = 1
                        exp_year += 1
                
                # F to C
                dewp   = (float(elems[5]) - 32) / 1.8
                frshtt = elems[6]
                # if len(frshtt) < 6:
                #     frshtt = ('0' * (6 - len(frshtt))) + frshtt
                # knot to km/h
                gust   = float(elems[7]) * 1.852
                # F to C
                tmax   = (float(elems[8]) - 32) / 1.8
                # F to C
                tmin   = (float(elems[9]) - 32) / 1.8
                # knot to km/h
                mxspd  = float(elems[10]) * 1.852
                # inch to mm
                prcp   = float(elems[11]) * 25.4
                slp    = float(elems[12])
                # inch to cm
                sndp   = float(elems[13]) * 2.54
                stp    = float(elems[14])
                if stp < 200:
                    stp += 1000
                # F to C
                temp   = (float(elems[15]) - 32) / 1.8
                # mile to km
                visib  = float(elems[16]) * 1.609344
                # knot to km/h
                wdsp   = float(elems[17]) * 1.852
                
                ki.write(frshtt + ';' + ('{:.1f}'.format(dewp) if dewp > -90 and dewp < 60 else str(99)) + ';' + ('{:.1f}'.format(temp) if temp > -90 and temp < 60 else str(99)) + ';' + ('{:.1f}'.format(tmax) if tmax > -90 and tmax < 60 else str(99)) + ';' + ('{:.1f}'.format(tmin) if tmin > -90 and tmin < 60 else str(99)) + ';' + ('{:.1f}'.format(wdsp) if wdsp >= 0 and wdsp < 600 else str(-1)) + ';' + ('{:.1f}'.format(mxspd) if mxspd >= 0 and mxspd < 600 else str(-1)) + ';' + ('{:.1f}'.format(gust) if gust >= 0 and gust < 600 else str(-1)) + ';' + ('{:.2f}'.format(prcp) if prcp >= 0 and prcp < 600 else str(-1)) + ';' + ('{:.1f}'.format(sndp) if sndp >= 0 and sndp < 600 else str(-1)) + ';' + ('{:.1f}'.format(slp) if slp > 800 and slp < 1200 else str(-1)) + ';' + ('{:.1f}'.format(stp) if stp > 400 and stp < 1200 else str(-1)) + ';' + ('{:.1f}'.format(visib) if visib >= 0 and visib < 200 else str(-1)) + '\n')
