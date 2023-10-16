//::///////////////////////////////////////////////
//::
//:: q2aa_env_kneel
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Enivid kneels to pray
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oEnivid = OBJECT_SELF;

    ActionPauseConversation();
    AssignCommand(oEnivid,ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,1.0,6.0));
    ActionResumeConversation();

}
