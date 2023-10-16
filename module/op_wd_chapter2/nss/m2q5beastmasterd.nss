//::///////////////////////////////////////////////
//:: User Defined
//:: M2Q5BeastMasterD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script controls the freeing of the caged
    creatures.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 9, 2001
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    object oLever1 = GetNearestObjectByTag("M2Q05PLEVER01");
    object oLever2 = GetNearestObjectByTag("M2Q05PLEVER02");
    object oDoor1 = GetObjectByTag("M2Q05DPORT01");
    object oDoor2 = GetObjectByTag("M2Q05DPORT02");
    object oDoor3 = GetObjectByTag("M2Q05DPORT03");
    object oDoor4 = GetObjectByTag("M2Q05DPORT04");

    switch (nEvent)
    {
        case 500:
            ActionInteractObject(oLever1);
            ActionInteractObject(oLever2);
            ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_BeastsFree",10));
            ActionMoveToObject(GetLocalObject(OBJECT_SELF,"NW_L_TargetOfAttack"),TRUE);
        break;
    }
}
