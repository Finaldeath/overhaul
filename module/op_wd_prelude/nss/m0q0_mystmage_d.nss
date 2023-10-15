void main()
{
    int nUser = GetUserDefinedEventNumber();
    if (nUser == 1002)
    {
        if (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") ==0)
        {
//            ActionStartConversation(OBJECT_SELF);
            SpeakOneLinerConversation();
            SetLocalInt(OBJECT_SELF,"NW_L_DOONCE",1);
        }
    }
    else
    if(nUser == 1006)
    {
        int nMaxHP = GetMaxHitPoints();
        int nCurrHP = GetCurrentHitPoints();

         // * generic surrender should only fire once
        if((nCurrHP * 2) <= nMaxHP && GetLocalInt(OBJECT_SELF,"Generic_Surrender") == 0)
        {
            SetLocalInt(OBJECT_SELF, "Generic_Surrender",1);
/*            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE,
RADIUS_SIZE_HUGE, GetLocation(OBJECT_SELF));
            while(GetIsObjectValid(oTarget))
            {
                if(oTarget != OBJECT_SELF)
                {
                    if(GetIsEnemy(oTarget))
                    {
                        AdjustReputation(oTarget, OBJECT_SELF, 50);
                        ClearPersonalReputation(oTarget);
                        SetIsTemporaryFriend(oTarget);
                        SpeakString(GetName(oTarget) +  " Adjusted to" +
IntToString(GetReputation(OBJECT_SELF, oTarget)));
                    }
                    AssignCommand(oTarget, ClearAllActions());
                    AssignCommand(oTarget,
ActionAttack(OBJECT_INVALID));
                }
                oTarget = GetNextObjectInShape(SHAPE_SPHERE,
RADIUS_SIZE_HUGE, GetLocation(OBJECT_SELF));
            }
*/
            ClearAllActions();
            SpeakOneLinerConversation();
        }
    }

int nEvent = GetUserDefinedEventNumber();

switch(nEvent)
    {
     case 0:
        {
        //* Summon 2 Goblins
        effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
        //Apply the VFX impact and summon effect
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, GetLocation(GetNearestObjectByTag("WP_M0Q0_GOB_1")));
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, GetLocation(GetNearestObjectByTag("WP_M0Q0_GOB_2")));
        CreateObject(OBJECT_TYPE_CREATURE,"M1Q0D19GOBLIN",GetLocation(GetNearestObjectByTag("WP_M0Q0_GOB_1")));
        CreateObject(OBJECT_TYPE_CREATURE,"M1Q0D19GOBLIN",GetLocation(GetNearestObjectByTag("WP_M0Q0_GOB_2")));
        }
        break;
     case 1:
        {
        //* Summon 2 Goblins then Teleport away
        effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
        //Apply the VFX impact and summon effect
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, GetLocation(GetNearestObjectByTag("WP_M0Q0_GOB_1")));
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, GetLocation(GetNearestObjectByTag("WP_M0Q0_GOB_2")));
        CreateObject(OBJECT_TYPE_CREATURE,"M1Q0D19GOBLIN",GetLocation(GetNearestObjectByTag("WP_M0Q0_GOB_1")));
        CreateObject(OBJECT_TYPE_CREATURE,"M1Q0D19GOBLIN",GetLocation(GetNearestObjectByTag("WP_M0Q0_GOB_2")));
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_UNSUMMON),OBJECT_SELF);
        DestroyObject(OBJECT_SELF,2.0);
        }
        break;
    }
}
