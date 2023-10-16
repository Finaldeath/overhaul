//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName  q1rural_ud_becka
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 4/03
//:://////////////////////////////////////////////
int GetIsInTrigger(object oTrigger, object oCreature);
void main()
{
    int nUser = GetUserDefinedEventNumber();
    if (nUser = 1001)
    {
        if (GetLocalInt(OBJECT_SELF, "nJumpOutsideCave") == 1 && GetLocalInt(GetModule(), "X1_Q1RuralRebFree") >= 70)
        {
            if (IsInConversation(OBJECT_SELF) == FALSE)
            {
                object oExit = GetWaypointByTag("wp_q1rbecka_running");
                ActionMoveToObject(oExit, TRUE);
            }
        }
    }
    else if(nUser == 1007) // DEATH
    {
        SetLocalInt(GetModule(), "X1_BECKADIED", 10);
        object oPC = GetLastHostileActor();
        if (GetIsPC(oPC) == TRUE)
        {
            AddJournalQuestEntry("q1footrumgut", 40, oPC);

            //If she's in the cave - Rumgut will attack the killer
            object oCage = GetObjectByTag("q1rumgut_range_trigger");
            object oRumgut = GetObjectByTag("q1foot_rumgut");
            if (oRumgut != OBJECT_INVALID)
            {
                SetIsTemporaryEnemy(oPC, oRumgut);
                AssignCommand(oRumgut, SpeakStringByStrRef(40305));
                if (GetIsInTrigger(oCage, oPC) == TRUE)
                {
                    //SendMessageToPC(GetFirstPC(), "Should be destroying cage");
                    SetLocalInt(OBJECT_SELF, "nAttacked", 1);
                    object oDoor1 = GetObjectByTag("q1rumgutcage1");
                    object oDoor2 = GetObjectByTag("q1rumgutcage2");
                    object oDoor3 = GetObjectByTag("q1rumgutcage3");
                    object oDoor4 = GetObjectByTag("q1rumgutcage4");
                    object oDoor5 = GetObjectByTag("q1rumgutcage5");
                    object oDoor6 = GetObjectByTag("q1rumgutcage6");
                    object oDoor7 = GetObjectByTag("q1rumgutcage7");
                    SetPlotFlag(oDoor1, FALSE);
                    SetPlotFlag(oDoor2, FALSE);
                    SetPlotFlag(oDoor3, FALSE);
                    SetPlotFlag(oDoor4, FALSE);
                    SetPlotFlag(oDoor5, FALSE);
                    SetPlotFlag(oDoor6, FALSE);
                    SetPlotFlag(oDoor7, FALSE);
                    effect eDamage = EffectDamage(10);
                    AssignCommand(OBJECT_SELF, ActionAttack(oDoor4));

                    DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor1));
                    DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor2));
                    DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor3));
                    DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor4));
                    DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor5));
                    DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor6));
                    DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor7));

                    DelayCommand(6.0, AssignCommand(oRumgut, ActionAttack(oPC)));
                }
                else
                {
                    AssignCommand(oRumgut, ActionAttack(oPC));
                }
            }
            if (GetTag(GetArea(OBJECT_SELF)) == "q1krumgut")
            {
                object oRumgut = GetObjectByTag("q1foot_rumgut");
                if (oRumgut != OBJECT_INVALID)
                {

                    SetIsTemporaryEnemy(oPC, oRumgut);
                    AssignCommand(oRumgut, SpeakStringByStrRef(40305));
                    AssignCommand(oRumgut, ActionAttack(oPC));
                }
            }
         }
    }


}

int GetIsInTrigger(object oTrigger, object oCreature)
{
    object oTest = GetFirstInPersistentObject(oTrigger);
    while (oTest != OBJECT_INVALID)
    {
        if (GetName(oCreature) == GetName(oTest))
            return TRUE;
        oTest = GetNextInPersistentObject(oTrigger);
    }
    return FALSE;
}
