//::///////////////////////////////////////////////
//:: bk_shadow
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Let the player know that there is a shadow bridge here
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        AssignCommand(oPC, SpeakOneLinerConversation("bk_shadow"));
        DestroyObject(OBJECT_SELF);
    }
}
