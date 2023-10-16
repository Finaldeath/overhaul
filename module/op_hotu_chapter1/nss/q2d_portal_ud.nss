// Generates the constant portal effect

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // start effect
    {
        // VFX_IMP_SILENCE
        // VFX_IMP_SLOW
        // VFX_FNF_LOS_HOLY_10
        // VFX_IMP_HASTE
        effect eVis = EffectVisualEffect(470);
        int i;
        float fDelay;
        vector vPos = GetPosition(OBJECT_SELF);
        location lLoc;
        int nUp = 1;
        float fJump = 0.4;
        float fTimeJump = 0.08;
        while(fDelay < 10.0)
        {
            if(nUp == 1) // going up
            {
                vPos.z += fJump;
                if(vPos.z > 7.0)
                {
                    vPos.z = 7.0;
                    nUp = 0;
                }
            }
            else // going down
            {
                vPos.z -= fJump;
                if(vPos.z <= 0.2)
                {
                    vPos.z = 0.2;
                    nUp = 1;
                }
            }
            lLoc = Location(GetArea(OBJECT_SELF), vPos, 0.0);
            DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLoc));
            fDelay += fTimeJump;
        }
        DelayCommand(fDelay, SignalEvent(OBJECT_SELF, EventUserDefined(101)));

    }
}
