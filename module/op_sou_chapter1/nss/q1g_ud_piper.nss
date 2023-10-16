//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q1g_ud_piper
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Piper's talk of doom...
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Feb 10/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetAILevel(OBJECT_SELF) != AI_LEVEL_VERY_LOW)
        {
            if (GetLocalInt(GetModule(), "X1_PIPERQUEST") != 30)
            {
                if (IsInConversation(OBJECT_SELF) == FALSE)
                {
                    int nSpeak = Random(5) + 1;
                    if (nSpeak == 1)
                    {
                        SpeakStringByStrRef(40349);
                    }
                    else if (nSpeak == 2)
                    {
                        SpeakStringByStrRef(40350);
                    }
                    else if (nSpeak == 3)
                    {
                        SpeakStringByStrRef(40351);
                    }
                    else if (nSpeak == 4)
                    {
                        SpeakStringByStrRef(40352);
                    }
                    else if (nSpeak == 5)
                    {
                        SpeakStringByStrRef(40353);
                    }
                }
            }
        }
    }

    else if(nUser == 1007) // DEATH
    {
        if (GetLocalInt(OBJECT_SELF, "nDied") != 1)
        {
            object oPC = GetLastHostileActor();
            if (GetIsPC(oPC) == FALSE)
                oPC = GetFirstPC();

            SetLocalInt(OBJECT_SELF, "nDied", 1);
            SetLocalInt(GetModule(), "X1_PIPERQUEST", 80);
            if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYq1gprophet") > 0)
            {
                AddJournalQuestEntry("q1gprophet", 20, oPC);
            }
            else
            {
                AddJournalQuestEntry("q1gprophet", 25, oPC);
            }
            //Have commoner's disperse
            object oCommon1 = GetObjectByTag("q1g_pip_common1");
            object oCommon2 = GetObjectByTag("q1g_pip_common2");
            object oCommon3 = GetObjectByTag("q1g_pip_common3");
            object oCommon4 = GetObjectByTag("q1g_pip_common4");
            object oCommon5 = GetObjectByTag("q1g_pip_common5");
            object oCommon6 = GetObjectByTag("q1g_pip_common6");

            AssignCommand(oCommon1, ActionRandomWalk());
            AssignCommand(oCommon2, ActionRandomWalk());
            AssignCommand(oCommon3, ActionRandomWalk());
            AssignCommand(oCommon4, ActionRandomWalk());
            AssignCommand(oCommon5, ActionRandomWalk());
            AssignCommand(oCommon6, ActionRandomWalk());

            DestroyObject(oCommon1, 4.0);
            DestroyObject(oCommon2, 5.5);
            DestroyObject(oCommon3, 6.0);
            DestroyObject(oCommon4, 7.0);
            DestroyObject(oCommon5, 8.0);
            DestroyObject(oCommon6, 9.7);

            DelayCommand(0.5, AssignCommand(oCommon1, SpeakStringByStrRef(40354)));
            DelayCommand(1.5, AssignCommand(oCommon2, SpeakStringByStrRef(40354)));
            DelayCommand(0.6, AssignCommand(oCommon3, SpeakStringByStrRef(40354)));
            DelayCommand(1.0, AssignCommand(oCommon4, SpeakStringByStrRef(40354)));
            DelayCommand(1.1, AssignCommand(oCommon5, SpeakStringByStrRef(40354)));
            DelayCommand(0.2, AssignCommand(oCommon6, SpeakStringByStrRef(40354)));

            //Turn off sound object
            object oPiperSound = GetObjectByTag("q1bpipersound");
            SoundObjectStop(oPiperSound);
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

