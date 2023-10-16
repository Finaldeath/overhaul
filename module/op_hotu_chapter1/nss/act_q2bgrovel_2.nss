//::///////////////////////////////////////////////
//:: Name  act_q2bgrovel_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Grovel flees in terror
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 29/03
//:://////////////////////////////////////////////

void main()
{
    //Don't kill self if upstairs
    if(GetLocalInt(GetModule(),"Grovel")> 0)
        return;

    object oGrovel = OBJECT_SELF;
    object oTarget = GetWaypointByTag("wp_q2bgrovel_flee");
    ActionMoveToObject(oTarget, TRUE);
    DelayCommand(0.2, SetCommandable(FALSE, oGrovel));
//    DelayCommand(5.0, ChangeToStandardFaction(oGrovel, STANDARD_FACTION_HOSTILE));
    DestroyObject(OBJECT_SELF, 3.4);


}
