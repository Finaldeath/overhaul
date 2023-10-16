//::///////////////////////////////////////////////
//:: Name x2_pkeg_take
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Pick up the Powderkeg and put it in the PCs
    inventory
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: June 12/03
//:://////////////////////////////////////////////

void main()
{
    ActionPauseConversation();
    AssignCommand(GetPCSpeaker(),ActionPlayAnimation( ANIMATION_LOOPING_GET_LOW,1.0f,3.0f));
    ActionWait(3.0f);
    CreateItemOnObject("x2_it_pkeg",GetPCSpeaker());
    DestroyObject(OBJECT_SELF);
}
