//::///////////////////////////////////////////////
//:: Name act_q2dlavgirl1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Slave girl runs off screaming.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////

void main()
{
    AddJournalQuestEntry("q2_femslave",30,GetPCSpeaker());

    object oGirl = OBJECT_SELF;
    object oPC = GetPCSpeaker();
    DestroyObject(oGirl, 10.0);
    ActionMoveAwayFromObject(oPC, TRUE);
    SetCommandable(FALSE, oGirl);

}
