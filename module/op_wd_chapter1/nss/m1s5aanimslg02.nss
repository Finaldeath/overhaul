void AnimalGoToPortal();

void main()
{
    // Release the animal from domination if it has been dominated.
    object oMaster = GetMaster();
    if ( GetIsObjectValid(oMaster) )
    {
        effect eEffect = GetFirstEffect(OBJECT_SELF);
        while ( GetIsEffectValid(eEffect) )
        {
            int nEffectType = GetEffectType(eEffect);
            if ( nEffectType == EFFECT_TYPE_DOMINATED )
            {
                RemoveEffect(OBJECT_SELF,eEffect);
            }
            eEffect = GetNextEffect(OBJECT_SELF);
        }
    }

    // Give the domination effect a chance to wear off first.
    DelayCommand(1.0,AnimalGoToPortal());
}


void AnimalGoToPortal()
{
    SetLocalInt(GetArea(OBJECT_SELF),"NW_L_Free",GetLocalInt(GetArea(OBJECT_SELF),"NW_L_Free") + 1);
    effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
    ClearAllActions();

    ActionForceMoveToObject(GetNearestObjectByTag("WP_M1S5BDestroy"),TRUE,2.0);
    ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,OBJECT_SELF));
    if(GetLocalInt(GetArea(OBJECT_SELF),"NW_L_Free") >= 4)
    {
        ActionDoCommand(SignalEvent(GetArea(OBJECT_SELF),EventUserDefined(700)));
    }
    ActionDoCommand(DestroyObject(OBJECT_SELF,0.5));

    SetCommandable(FALSE);
}
