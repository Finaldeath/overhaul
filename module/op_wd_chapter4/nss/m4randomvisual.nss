// * randomly plays a visual effect every heartbeat once activated (Morag's death)

int MakeNiceVisual()
{
    int nVis = 1;
    int nRandom = Random(6) + 1;
    switch (nRandom)
    {
        case 1: nVis = VFX_FNF_DISPEL_DISJUNCTION; break;
        case 2: nVis = VFX_FNF_GAS_EXPLOSION_NATURE; break;
        case 3: nVis = VFX_IMP_BREACH; break;
        case 4: nVis = VFX_IMP_ELEMENTAL_PROTECTION; break;
        case 5: nVis = VFX_IMP_LIGHTNING_S; break;
        case 6: nVis = VFX_IMP_FLAME_M; break;
     }
     return nVis;
}
int MakeBadVisual()
{
    int nVis = 1;
    int nRandom = Random(6) + 1;
    switch (nRandom)
    {
        case 1: nVis = VFX_FNF_HORRID_WILTING; break;
        case 2: nVis = VFX_FNF_GAS_EXPLOSION_EVIL; break;
        case 3: nVis = VFX_IMP_DESTRUCTION; break;
        case 4: nVis = VFX_IMP_DIVINE_STRIKE_FIRE; break;
        case 5: nVis = VFX_IMP_LIGHTNING_S; break;
        case 6: nVis = VFX_FNF_METEOR_SWARM; break;
     }
    return nVis;
}
void main()
{
    if (GetLocalInt(GetModule(), "NW_G_MORAGDEAD") == 10)
    {   int nVis = 1;
        if (GetTag(GetArea(OBJECT_SELF)) == "M4FinalArea")
        {
            nVis = MakeNiceVisual();
        }
        else
        {
            nVis = MakeBadVisual();
        }
    float fDelay = IntToFloat(Random(300)) * 0.01;

    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectVisualEffect(nVis), OBJECT_SELF));
    }
}
