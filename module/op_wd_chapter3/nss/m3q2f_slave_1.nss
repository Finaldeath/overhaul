// * creature randomly walks around
// * cannot be interacted with

void main()
{
    if (IsInConversation(OBJECT_SELF) == FALSE)
    {
        ClearAllActions();

    // * setup effect for temporal slaves/lizard -- OnSpawn did not work
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
        ActionRandomWalk();
    }
    if (!GetIsObjectValid(GetObjectByTag("M3Q2FGolem0")))
    {
        ClearAllActions();
        DestroyObject(OBJECT_SELF);
    }
 //   ActionDoCommand(SetCommandable(TRUE));
 //   SetCommandable(FALSE);
}
