//::///////////////////////////////////////////////
//:: act_kai_kneel
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala kneels
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
//Have Kaidala walk over to the spot where the acorn is buried and kneel down
    object oDirt = GetObjectByTag("q1e_kai_dirt");
    ActionPauseConversation();
    ActionMoveToObject(oDirt);
    ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE,1.0,4.0);
    ActionResumeConversation();
}
