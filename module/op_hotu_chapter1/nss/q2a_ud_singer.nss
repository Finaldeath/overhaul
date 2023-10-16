//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.

    Tavern Singer based on a script from Tolerance0
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 3/03
//:://////////////////////////////////////////////
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if(IsInConversation(OBJECT_SELF) == FALSE)
        {
            ActionWait(1.0);
            switch(Random(12))
            {
            case 0:
                PlaySound("as_pl_tavsongm3");
                break;
            case 1:
                PlaySound("as_pl_tavtoastm4");
                break;
            case 2:
                PlaySound("as_pl_tavarguem3");
                break;
            case 3:
                PlaySound("as_pl_callf1");
                break;
            case 4:
                PlaySound("as_pl_tavcallm3");
                break;
            case 5:
                PlaySound("as_pl_clap2");
                break;
            case 6:
                PlaySound("as_pl_taverngrp1");
                break;
            case 7:
                PlaySound("as_pl_taverngrp2");
                break;
            case 8:
                PlaySound("as_pl_taverngrp3");
                break;
            case 9:
                PlaySound("as_pl_taverngrp4");
                break;
            case 10:
                PlaySound("as_pl_tavlaughm3");
                break;
            case 11:
                PlaySound("as_pl_tavlaughm4");
                break;
            }
        }
    }

}
