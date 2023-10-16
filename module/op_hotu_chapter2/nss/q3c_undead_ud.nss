//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////
void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 1006 || nEvent == 1003) // damaged or combat round end
    {
        // running to the 3rd nearest negative trap to heal.
        //object oTarget = GetNearestObjectByTag("Q3C_TRAP_DNEGATRAP001", OBJECT_SELF, 3);
        object oPC = GetLastDamager();
        object oTarget = GetNearestObjectByTag("Q3C_WP_RUNTO", OBJECT_SELF, 2);
        int nCurHP = GetCurrentHitPoints();
        int nHealed = GetLocalInt(OBJECT_SELF, "HEALED");
        if(nCurHP < 70 && nHealed == 0)
        {
            SetLocalInt(OBJECT_SELF, "HEALDED", 1);
            ClearAllActions();
            //ActionMoveAwayFromObject(oPC, TRUE);
            ActionMoveToObject(oTarget, TRUE);
            ActionAttack(oPC);
            AssignCommand(OBJECT_SELF, SetCommandable(TRUE, OBJECT_SELF));
            SetCommandable(FALSE, OBJECT_SELF);
        }
        else if(nEvent == 1003) // let them use some parry a bit...
        {
            ClearAllActions();
            int nRand = Random(2) + 1;
            if (nRand == 1)
            {
                ClearAllActions();
                ActionUseSkill(SKILL_PARRY, oPC);
            }
        }
    }
    return;

}
