//::///////////////////////////////////////////////
// stinger archer dig in/out events
#include "nw_i0_generic"
#include "q1_cutscene"
#include "nw_i0_plot"

void DigOut(object oWP, int bAttack = TRUE)
{
    if(GetIsDead(OBJECT_SELF))
        return;
    effect eDust = EffectVisualEffect(137);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDust, GetLocation(oWP));
    DelayCommand(0.5, JumpToObject(oWP));
   if(bAttack == TRUE)
        DelayCommand(0.8, DetermineCombatRound());
   else
        ClearAllActions();

}

void DigIn()
{
    effect eDust = EffectVisualEffect(137);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDust, GetLocation(OBJECT_SELF));
    object oWP = GetWaypointByTag("Q1_WP_JUMP_BETWEEN");
    JumpToObject(oWP);
    //CreateObject(OBJECT_TYPE_PLACEABLE, "q1_hole1", GetLocation(OBJECT_SELF));
}

void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == EVENT_HEARTBEAT || nEvent == EVENT_DAMAGED || nEvent == EVENT_ATTACKED ||
            nEvent == EVENT_END_COMBAT_ROUND)
    {
        // Whenvenr a player gets too close - dig in the ground, find the next place to dig out,
        // dig out and resume attack.
        object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE);
        if(!GetIsPlayerCharacter(oCreature) && !(GetMaster(oCreature) != OBJECT_INVALID))
            return;
        float fDistance = GetDistanceBetween(OBJECT_SELF, oCreature);
        if(fDistance > 10.0 || !GetIsInCombat())
            return;

        int nJumpCount = GetLocalInt(OBJECT_SELF, "Q1_JUMP_COUNT");
        string sWPTag = "Q1_WP_NEXT_" + GetTag(OBJECT_SELF) + IntToString(nJumpCount);
        object oWP = GetWaypointByTag(sWPTag);
        if(oWP == OBJECT_INVALID)
            return;
        nJumpCount++;
        SetLocalInt(OBJECT_SELF, "Q1_JUMP_COUNT", nJumpCount);
        /*if(nJumpCount == 2) // second jump -> going out of manticore lair -> time to start cutscene
        {
            AssignCommand(oPC, ClearAllActions());

            SetLocalInt(oPC, "nCutsceneNumber", CUTSCENE_NUMBER);
            SetLocalInt(oPC, "nCUT1MAINPC", 1);
            SetLocalInt(GetModule(), "X1_CUT1RUNNING", CUTSCENE_NUMBER);

            StartCutscene(oPC);
        }*/

        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE_JUMP" + IntToString(nJumpCount));
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ONCE_JUMP" + IntToString(nJumpCount), 1);

        DigIn();
        if(nJumpCount == 2)
            DelayCommand(15.0, DigOut(oWP, FALSE));
        else
            DelayCommand(3.0, DigOut(oWP));
    }
    /*else if(nEvent == 1007) // death event
    {
        // if the stinger is killed INSIDE the manticore lair (-> jumped once) then
        // mark a flag that would allow the manticore_oe trigger to init the cutscene
        // OR init the cutscene if a player is already inside the trigger.
        if(GetLocalInt(OBJECT_SELF, "Q1_JUMP_COUNT") == 1)
        {

        }
    }*/
    return;

}
