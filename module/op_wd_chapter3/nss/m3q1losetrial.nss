
//::///////////////////////////////////////////////
//:: Lose Trial
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player lost the trial.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: November 13 2001
//:://////////////////////////////////////////////

void main()
{
//        SpeakString("Lose Trial Script ran");

    // * Have Igan say his parting dialog
        CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q1ROGANSHEAD",GetLocation(GetObjectByTag("M3Q1_ROGAN_HEAD")));

    object oProsecutor = GetObjectByTag("Igland3Q11");
    if (GetIsObjectValid(oProsecutor) == TRUE)
    {
        SetLocalInt(oProsecutor,"M3Q1ProsecutionWon",1);
        AssignCommand(oProsecutor,ActionStartConversation(OBJECT_SELF));
    }
}
