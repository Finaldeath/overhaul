void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101)
    {
        vector vPos = GetPosition(OBJECT_SELF);
        vPos.z += 1.5;
        location lLoc = Location(GetArea(OBJECT_SELF), vPos, 0.0);
        float fRand = IntToFloat(Random(6) + 1) / 5.0;
        effect eVis = EffectVisualEffect(VFX_DUR_SMOKE);
        DelayCommand(fRand, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, lLoc, 1.0));
        DelayCommand(fRand, PlaySound ("cb_sh_prjtlacid"));
    }
}
