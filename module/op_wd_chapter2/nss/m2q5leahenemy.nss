//::///////////////////////////////////////////////
//::
//:: Conversation
//::
//:: M2Q5LeahEnemy.NSS
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: Set Leah hostile toward the PC.
//::
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: John
//:: Created On: September 25, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    AdjustReputation(OBJECT_SELF,GetLastSpeaker(),-100);
}
