//::///////////////////////////////////////////////
//:: Name: q1a2_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set a number on the PC on enter of the apprentice
    quarters so that in multi-player - extra pcs
    are jumped to a different room...
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Feb 10/03
//:://////////////////////////////////////////////


void main()
{
    //Get the entering object
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE || GetIsDM(oPC) == TRUE)
    {
        return;
    }

    //The first time a PC enters the area (on start of the game)
    if (GetLocalInt(oPC, "Chapt1FirstJump") == 0)
    {
        SetLocalInt(oPC, "Chapt1FirstJump", 1);
        if (GetLocalInt(oPC, "nPCNumber") > 1)
        {

         object oPCxJump = GetObjectByTag("q1a2_enter_playerx");
         //Jump new PC to multiplayer entrance room
         //BlackScreen(oPC);
         AssignCommand(oPC, JumpToObject(oPCxJump));
         //DelayCommand(4.0, FadeFromBlack(oPC));
            //update journal entries - if needed.
            //find the lowest 'numbered' pc
        }
    }
}

