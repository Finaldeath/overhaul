// removed the frost giant polymorph effect. This script should be on the dragon's on-death event
// and on the area on-exit event.

#include "nw_i0_generic"
#include "nw_i0_plot"
void main()
{

   object oExiter = GetExitingObject();
   if (GetIsPlayerCharacter(oExiter))
    {
        SetLocalInt(GetModule(), "X1_Q5B_NUMPC", GetLocalInt(GetModule(), "X1_Q5B_NUMPC") - 1);
        if (GetLocalInt(GetModule(), "X1_Q5B_NUMPC") < 1 && GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS") != 3)
        {
            //If there are no PCs on this level - Jnah can rest..
            object oTymofarrar = GetObjectByTag("NW_DRGWHITE001");
            AssignCommand(oTymofarrar, ClearAllActions(TRUE));
            AssignCommand(oTymofarrar, ActionRest());
        }
        //make sure the PC exiter used the phylactery
        if (GetLocalInt(oExiter, "X1_nPolymorphGiant") == 1)
        {
            //increment his exit count (first time is on polymorph)
            //SetLocalInt(oExiter, "X1_nTimesExitedDragonCave", GetLocalInt(oExiter, "X1_nTimesExitedDragonCave") + 1);
            //second time exiting must be through the door, so un-polymorph
            //if (GetLocalInt(oExiter, "X1_nTimesExitedDragonCave") > 1)
            //{
                object oPC = GetLocalObject(GetModule(), "X1_POLY_FROST_GIANT");
                if (GetName(oExiter) == GetName(oPC))
                {
                    if(GetHasEffect(EFFECT_TYPE_POLYMORPH, oPC))
                    {
                        effect ePoly = GetFirstEffect(oPC);
                        while(GetIsEffectValid(ePoly))
                        {
                            RemoveEffect(oPC, ePoly);
                            ePoly = GetNextEffect(oPC);
                        }
                    }
                }
            //}
            //first time set tymofarrar as hostile
            //else
            //{
            //    object oDragon = GetNearestObjectByTag("NW_DRGWHITE001", oExiter);
            //    SetIsTemporaryEnemy(oExiter, oDragon);
            //    AssignCommand(oDragon, DetermineCombatRound(oExiter));
            //}
        }
    }
}
