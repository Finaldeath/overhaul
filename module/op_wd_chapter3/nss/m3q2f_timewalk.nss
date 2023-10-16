// * creature randomly walks around
// * cannot be interacted with

void main()
{
    if (!GetIsObjectValid(GetNearestObjectByTag("M3Q2FGolem0"))
        && !GetIsObjectValid(GetNearestObjectByTag("M3Q2FGolem1"))
        && !GetIsObjectValid(GetNearestObjectByTag("M3Q2FGolem2"))
        && !GetIsObjectValid(GetNearestObjectByTag("M3Q2FGolem3"))
        && !GetIsObjectValid(GetNearestObjectByTag("M3Q2FGolem4")))
    {
        ClearAllActions();
        SetPlotFlag(OBJECT_SELF,FALSE);
        effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
        location lSlave =GetLocation(OBJECT_SELF);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,lSlave);
        DestroyObject(OBJECT_SELF);
    }
    else if (IsInConversation(OBJECT_SELF) == FALSE)
    {
        ClearAllActions();

        // * setup effect for temporal slaves/lizard -- OnSpawn did not work
        if (GetTag(OBJECT_SELF) == "M3Q2FTIMELIZARD" || GetTag(OBJECT_SELF) == "" )
        {
            if (GetLocalInt(OBJECT_SELF, "NW_L_EFFECTAPPLIED") == 0)
            {
                effect eVis =  EffectVisualEffect(VFX_DUR_GHOSTLY_PULSE);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
                SetLocalInt(OBJECT_SELF, "NW_L_EFFECTAPPLIED",1);
            }
            else
            {
                int nRandom = Random(15) + 1;
                switch (nRandom)
                {
                    case 1: case 2: case 3: ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT,1.0, 6.0); break;
                    case 4: case 5: case 6: ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT,1.0, 6.0); break;
                    case 7: case 8: ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD,1.0, 6.0); break;
                    case 9: case 10: ActionPlayAnimation(ANIMATION_LOOPING_LISTEN,1.0, 6.0); break;
                    case 11: case 12: ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0, 6.0); break;
                }
            }
        }
        ActionRandomWalk();
    }
 //   ActionDoCommand(SetCommandable(TRUE));
 //   SetCommandable(FALSE);
}
