// check if stinger battle is over and then - Katriana inits dialog with pc

#include "x1_inc_plot"

void Revive(object oObject)
{
    ClearAllActions();
    SetCommandable(TRUE);
    effect eHeal = EffectHeal(GetMaxHitPoints(oObject));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oObject);
    SetLocalInt(oObject, "DEAD", 0);
}

void main()
{
    int nBattle = GetLocalInt(GetArea(OBJECT_SELF), "CUTSCENE_STARTED");
    if(nBattle == 0)
        return;
    object oKatriana = GetObjectByTag("Q1_KATRIANA");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oKatriana);
    int nTalkedToPC = GetLocalInt(oKatriana, "Q1_TALKED_ABOUT_MISSING_GUIDE");
        if(nTalkedToPC == 1) // if Katriana has already complained about the guide - then do not do it again
        {
            if(GetPlot("Q1_JOURNAL_MISSING_GUIDE") == 0)
                return;
            int n = 1;
            object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, n);
            string sTag;
            object oWP;
            object oFocus = GetNearestObjectByTag("CampfireCauldron", oPC);
            while(oCreature != OBJECT_INVALID)
            {
                sTag = "XPOST_" + GetTag(oCreature);
                oWP = GetNearestObjectByTag(sTag, oPC);
                if(oWP != OBJECT_INVALID && GetMaster(oCreature) == OBJECT_INVALID && !IsInConversation(oCreature))
                {
                   AssignCommand(oCreature, ClearAllActions());
                   AssignCommand(oCreature, ActionForceMoveToObject(oWP));
                   AssignCommand(oCreature, ActionDoCommand(SetFacingPoint(GetPosition(oFocus))));
                }
                n++;
                oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, n);
            }
            return;
        }
    object oTorias = GetObjectByTag("Q1_TORIAS");
    object oStinger = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_MONSTROUS, oKatriana);
    if(oStinger == OBJECT_INVALID || GetArea(oStinger) != GetArea(oKatriana))
    {
        Revive(oKatriana);
        Revive(oTorias);
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oKatriana, ClearAllActions(TRUE));
        AssignCommand(oKatriana, ActionStartConversation(oPC));

    }

}
