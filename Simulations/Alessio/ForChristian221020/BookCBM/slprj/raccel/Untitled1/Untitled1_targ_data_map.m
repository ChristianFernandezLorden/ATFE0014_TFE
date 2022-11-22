    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 1;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc paramMap
        ;%
        paramMap.nSections           = nTotSects;
        paramMap.sectIdxOffset       = sectIdxOffset;
            paramMap.sections(nTotSects) = dumSection; %prealloc
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (rtP)
        ;%
            section.nData     = 17;
            section.data(17)  = dumData; %prealloc

                    ;% rtP.SineWave_Amp
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.SineWave_Bias
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.SineWave_Freq
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% rtP.SineWave_Phase
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% rtP.SineWave_Amp_gtkrkjckvw
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 4;

                    ;% rtP.SineWave_Bias_lm2amzzq1o
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 5;

                    ;% rtP.SineWave_Freq_lwz20jzl5j
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 6;

                    ;% rtP.SineWave_Phase_kq4yrsmvx1
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 7;

                    ;% rtP.Constant_Value
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 8;

                    ;% rtP.Constant1_Value
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 9;

                    ;% rtP.Constant2_Value
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 10;

                    ;% rtP.Constant3_Value
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 11;

                    ;% rtP.Constant4_Value
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 12;

                    ;% rtP.Constant5_Value
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 13;

                    ;% rtP.V0_Value
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 14;

                    ;% rtP.V0_Value_ijxamwyxru
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 15;

                    ;% rtP.RTP_027A0CB6_GravityVector_Value
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 16;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section


            ;%
            ;% Non-auto Data (parameter)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        paramMap.nTotData = nTotData;



    ;%**************************
    ;% Create Block Output Map *
    ;%**************************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 7;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc sigMap
        ;%
        sigMap.nSections           = nTotSects;
        sigMap.sectIdxOffset       = sectIdxOffset;
            sigMap.sections(nTotSects) = dumSection; %prealloc
        sigMap.nTotData            = -1;

        ;%
        ;% Auto data (rtB)
        ;%
            section.nData     = 12;
            section.data(12)  = dumData; %prealloc

                    ;% rtB.bp3pppoyvc
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.al4dlzzee3
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 13;

                    ;% rtB.bxrj01vgkv
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 26;

                    ;% rtB.m05vyxtmat
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 27;

                    ;% rtB.kgzqkrdohc
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 31;

                    ;% rtB.osrdp3vcae
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 33;

                    ;% rtB.oj23ghszu3
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 34;

                    ;% rtB.ohhlnpvtnb
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 35;

                    ;% rtB.etpouhlg5j
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 36;

                    ;% rtB.o4mvedy5x2
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 37;

                    ;% rtB.dqx50lsmsy
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 38;

                    ;% rtB.o0x1n3piu3
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 39;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtB.csiqn5xj0p.nlkstedhnb
                    section.data(1).logicalSrcIdx = 12;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(2) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtB.plbg54lico.bcbbityvgg
                    section.data(1).logicalSrcIdx = 13;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(3) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtB.cqigm5udrw.nlkstedhnb
                    section.data(1).logicalSrcIdx = 14;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(4) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtB.oo3ambzquj.bcbbityvgg
                    section.data(1).logicalSrcIdx = 15;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(5) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtB.kx2u2otjiy.krfr5v4lja
                    section.data(1).logicalSrcIdx = 16;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(6) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtB.ha2dloucon.krfr5v4lja
                    section.data(1).logicalSrcIdx = 17;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(7) = section;
            clear section


            ;%
            ;% Non-auto Data (signal)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        sigMap.nTotData = nTotData;



    ;%*******************
    ;% Create DWork Map *
    ;%*******************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 4;
        sectIdxOffset = 7;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc dworkMap
        ;%
        dworkMap.nSections           = nTotSects;
        dworkMap.sectIdxOffset       = sectIdxOffset;
            dworkMap.sections(nTotSects) = dumSection; %prealloc
        dworkMap.nTotData            = -1;

        ;%
        ;% Auto data (rtDW)
        ;%
            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% rtDW.i5gqks14de
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.fom02y4gvs
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 2;

                    ;% rtDW.gjy15tdmce
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 17;
            section.data(17)  = dumData; %prealloc

                    ;% rtDW.d2hnjrl1o4.LoggedData
                    section.data(1).logicalSrcIdx = 3;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.bbpuvhaqb1
                    section.data(2).logicalSrcIdx = 4;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.ntaizccyaf
                    section.data(3).logicalSrcIdx = 5;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.am0ltiyuj4
                    section.data(4).logicalSrcIdx = 6;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.llvyklp4og
                    section.data(5).logicalSrcIdx = 7;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.pcox02acsz
                    section.data(6).logicalSrcIdx = 8;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.ph5j124dx2
                    section.data(7).logicalSrcIdx = 9;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.c4m2irodvz
                    section.data(8).logicalSrcIdx = 10;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.lrhuya04aq
                    section.data(9).logicalSrcIdx = 11;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.pf2k450y4x
                    section.data(10).logicalSrcIdx = 12;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.hjaupytzr5
                    section.data(11).logicalSrcIdx = 13;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.fvjjkkzxed
                    section.data(12).logicalSrcIdx = 14;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.esj1tra544.LoggedData
                    section.data(13).logicalSrcIdx = 15;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.gm04pf5aht.LoggedData
                    section.data(14).logicalSrcIdx = 16;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.pqkzuikhvq
                    section.data(15).logicalSrcIdx = 17;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.ecbolhy3dm
                    section.data(16).logicalSrcIdx = 18;
                    section.data(16).dtTransOffset = 15;

                    ;% rtDW.jmlnaok3wg
                    section.data(17).logicalSrcIdx = 19;
                    section.data(17).dtTransOffset = 16;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% rtDW.psybpwndnj
                    section.data(1).logicalSrcIdx = 20;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.lg1ypko4k2
                    section.data(2).logicalSrcIdx = 21;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.jepf1iw4x1
                    section.data(3).logicalSrcIdx = 22;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.jw3jeluxdh
                    section.data(4).logicalSrcIdx = 23;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% rtDW.jqp0un0nfr
                    section.data(1).logicalSrcIdx = 24;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.di50jkv023
                    section.data(2).logicalSrcIdx = 25;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.gd2flceb3v
                    section.data(3).logicalSrcIdx = 26;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section


            ;%
            ;% Non-auto Data (dwork)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        dworkMap.nTotData = nTotData;



    ;%
    ;% Add individual maps to base struct.
    ;%

    targMap.paramMap  = paramMap;
    targMap.signalMap = sigMap;
    targMap.dworkMap  = dworkMap;

    ;%
    ;% Add checksums to base struct.
    ;%


    targMap.checksum0 = 3660660612;
    targMap.checksum1 = 34751504;
    targMap.checksum2 = 1021262967;
    targMap.checksum3 = 2058824963;

