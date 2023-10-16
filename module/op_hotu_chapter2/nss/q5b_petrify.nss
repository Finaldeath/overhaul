// Petrify all nearby statues

void main()
{
    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_STONE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_STONE_ONCE", 1);
    float fDistance;

    effect eStone = EffectPetrify();
    int i = 1;
    object oStatue = GetNearestObjectByTag("q5b_statue", OBJECT_SELF, i);
    while(oStatue != OBJECT_INVALID)
    {
        fDistance = GetDistanceBetween(OBJECT_SELF, oStatue);
        if(fDistance > 10.0)
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStatue));
        else
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStatue);
        i++;
        oStatue = GetNearestObjectByTag("q5b_statue", OBJECT_SELF, i);
    }
}
