//::///////////////////////////////////////////////
//:: Name q2a_ent_durntrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   //if Durnan has just been created - then Tamsil is missing so approach the
//first PC to cross the trigger and initiate conversation
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 12/02
//:://////////////////////////////////////////////


void main()
{
    if (GetLocalInt(GetModule(), "nStartTamsil") == 4)
    {
        object oPC = GetEnteringObject();
        if (GetIsPC(oPC) == TRUE)
        {
            object oDurnan =  GetObjectByTag("q2adurnan");
            AssignCommand(oDurnan, ActionStartConversation(oPC));
            SetLocalInt(GetModule(), "nStartTamsil", 5);
        }
    }
}
