// Petrify any nearby statues

void main()
{
    object oStatue = GetNearestObjectByTag("Q4A_STATUE");
    effect eStone = EffectPetrify();
    int n = 1;
    float fDistance;
    while(oStatue != OBJECT_INVALID)
    {
        fDistance = GetDistanceBetween(OBJECT_SELF, oStatue);
        if(fDistance >= 35.0)
        {
            return;
        }
        if(GetLocalInt(oStatue, "IMMUNE") == 0)
        {
            SetAILevel(oStatue, AI_LEVEL_HIGH);
            SetLocalInt(oStatue, "X1_L_IMMUNE_TO_DISPEL", 10);
            AssignCommand(oStatue, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStatue));
            DelayCommand(2.5, SetAILevel(oStatue, AI_LEVEL_VERY_LOW));
            //SetPlotFlag(oStatue, TRUE);
        }
        n++;
        oStatue = GetNearestObjectByTag("Q4A_STATUE", OBJECT_SELF, n);
    }
}
