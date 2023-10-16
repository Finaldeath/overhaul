//::///////////////////////////////////////////////
//:: Mythallar (User-Defined)
//:: UD_Mythallar.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the behavior of the Mythallar in the
     End Battle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 19, 2003
//:://////////////////////////////////////////////

void NextMythallar()
{
/*DEBUG*///object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    object oArea = GetArea(OBJECT_SELF);
    int bMythallarDestroyed = GetLocalInt(oArea, "bMythallarDestroyed");
    int bClockwise = GetLocalInt(oArea, "bClockwise");
    string sMyTag = GetTag(OBJECT_SELF);
    string sMyNumber = GetStringRight(sMyTag, 2);
    int iMyNumber = StringToInt(sMyNumber);
    int iNextNumber;
    string sNextNumber;
    object oNextMythallar;
    int iSwitchbacks = 0;
    int bVerified = FALSE;

    if (bMythallarDestroyed == FALSE)
    {
        while (bVerified == FALSE)
        {
            //Clockwise is positive
            if (bClockwise == TRUE)
            {
                iNextNumber = iMyNumber+1;
                if (iNextNumber > 16)
                {
                    iNextNumber = 01;
                }
            }

            //Counterclockwise is negative
            if (bClockwise == FALSE)
            {
                iNextNumber = iMyNumber-1;
                if (iNextNumber < 1)
                {
                    iNextNumber = 16;
                }
            }

            //Handle single digit numbers.
            sNextNumber = IntToString(iNextNumber);
    /*DEBUG*///SendMessageToPC(oPC, "sMyNumber == "+sMyNumber);
    /*DEBUG*///SendMessageToPC(oPC, "sNextNumber == "+sNextNumber);
            if (iNextNumber < 10)
            {
                sNextNumber = "0"+sNextNumber;
            }

            //Verify next Mythallar
            oNextMythallar = GetNearestObjectByTag("Mythallar_"+sNextNumber);
            if (GetIsDead(oNextMythallar) == FALSE)
            {
    /*DEBUG*///SendMessageToPC(oPC, "Next Mythallar verified");
                //If it's valid, activate it.
                SetLocalInt(oNextMythallar, "bActive", TRUE);
                SignalEvent(oNextMythallar, EventUserDefined(5010));

                //Deactivate myself.
                SetLocalInt(OBJECT_SELF, "bActive", FALSE);
                PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
                bVerified = TRUE;
            }
            else if (GetIsDead(oNextMythallar) == TRUE && iSwitchbacks < 2)
            {
    /*DEBUG*///SendMessageToPC(oPC, "Reversing Polarity");
                //Reverse polarity
                if (bClockwise == TRUE)
                {
                    bClockwise = FALSE;
                }
                else
                {
                    bClockwise = TRUE;
                }
                SetLocalInt(oArea, "bClockwise", bClockwise);
                iSwitchbacks++;
            }
            else if (GetIsDead(oNextMythallar) == TRUE && iSwitchbacks >= 2)
            {
    /*DEBUG*///SendMessageToPC(oPC, "Mythallar isolated");
                //This mythallar is isolated. Designate itself as the only valid
                //Mythallar
                SetLocalInt(OBJECT_SELF, "bIsolated", TRUE);
                oNextMythallar = OBJECT_SELF;
                bVerified = TRUE;
            }
        }
    }
}

void main()
{
    //Activate myself
    PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    SetLocalInt(OBJECT_SELF, "bActive", TRUE);

    //Delay the handling of the next Mythallar
    DelayCommand(1.0, NextMythallar());
}
