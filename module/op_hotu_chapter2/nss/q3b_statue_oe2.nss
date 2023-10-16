// Petrify any statues in the area

void RemoveEffects(object oObject)
{
    effect e = GetFirstEffect(oObject);
    while(GetIsEffectValid(e))
    {
        RemoveEffect(oObject, e);
        e = GetNextEffect(oObject);
    }
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    object oStatue = GetNearestObjectByTag("q3b_statue2");
    effect eStone = EffectPetrify();
    SetPlotFlag(oStatue, FALSE);
    AssignCommand(oStatue, PlayAnimation(ANIMATION_LOOPING_CONJURE1, 5.0, 3.0));
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStatue));
    //DelayCommand(1.0, SetPlotFlag(oStatue, TRUE));

}
