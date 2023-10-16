// Apply random effect around Nilmaldor's room

void main()
{
    vector v1 = Vector(15.0, 38.0, 0.0);
    vector v2 = Vector(25.0, 38.0, 0.0);
    vector v3 = Vector(16.0, 13.0, 0.0);
    vector v4 = Vector(26.0, 13.0, 0.0);

    location lLoc1 = Location(GetArea(OBJECT_SELF), v1, 0.0);
    location lLoc2 = Location(GetArea(OBJECT_SELF), v2, 0.0);
    location lLoc3 = Location(GetArea(OBJECT_SELF), v3, 0.0);
    location lLoc4 = Location(GetArea(OBJECT_SELF), v4, 0.0);

    effect eVis1= EffectVisualEffect(VFX_FNF_DISPEL);
    effect eVis2= EffectVisualEffect(VFX_FNF_DISPEL_GREATER);
    effect eVis3= EffectVisualEffect(VFX_FNF_WAIL_O_BANSHEES);

    int nRandEff = Random(3) + 1; // choose a random effect
    int nRandLoc = Random(4) + 1; // 1-4 a location
    location lLoc;
    effect eVis;

    switch(nRandEff)
    {
         case 1:
            eVis = eVis1;
            break;
         case 2:
            eVis = eVis2;
            break;
         case 3:
            eVis = eVis3;
            break;
    }

    switch(nRandLoc)
    {
        case 1:
            lLoc = lLoc1;
            break;
        case 2:
            lLoc = lLoc2;
            break;
        case 3:
            lLoc = lLoc3;
            break;
        case 4:
            lLoc = lLoc4;
            break;
    }

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLoc);
}
