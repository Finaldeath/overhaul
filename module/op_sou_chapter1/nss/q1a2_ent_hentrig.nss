//::///////////////////////////////////////////////
//:: Name q1a2_ent_hentrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The first time this trigger is crossed - the 3
    henchmen - Xanos, Mischa and Dorna will rush
    up to the PC and begin conversation with him/her.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Jan 31/03
//:://////////////////////////////////////////////

void main()
{

    if (GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        object oPC = GetEnteringObject();
        //Check to see if this is a possessed familiar entering the trigger
        if (GetIsPossessedFamiliar(oPC) == TRUE)
        {
            return;
        }
        else if (GetIsPC(oPC) == TRUE)
        {
            //Mark trigger as 'triggered'
            SetLocalInt(OBJECT_SELF, "nTriggered", 1);
            //Mark PC as trigger crosser
            object oPC = GetEnteringObject();
            AssignCommand(oPC, ClearAllActions());
            SetLocalObject(GetModule(), "X1_PCHENCHTALK", oPC);

            object oXanos = GetObjectByTag("x0_hen_xan_up");
            object oMischa = GetObjectByTag("x0_hen_mis_up");
            object oDorna = GetObjectByTag("x0_hen_dor_up");

            //location lXanos = GetLocation(GetWaypointByTag("wp_q2a2_xanos"));
            //location lMischa = GetLocation(GetWaypointByTag("wp_q2a2_mischa"));
            //location lDorna = GetLocation(GetWaypointByTag("wp_q2a2_dorna"));


            AssignCommand(oXanos, ActionStartConversation(oPC));
            //AssignCommand(oMischa, ActionStartConversation(oPC));
            //AssignCommand(oDorna, ActionStartConversation(oPC));
            AssignCommand(oMischa, ActionMoveToObject(oPC, TRUE));
            AssignCommand(oDorna, ActionMoveToObject(oPC, TRUE));
            DelayCommand(3.0, AssignCommand(oXanos, SetFacingPoint(GetPosition(oPC))));
            DelayCommand(3.0, AssignCommand(oMischa, SetFacingPoint(GetPosition(oPC))));
            DelayCommand(3.0, AssignCommand(oDorna, SetFacingPoint(GetPosition(oPC))));
        }
    }
}
