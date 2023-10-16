//at_q2afightdoor
void main()
{

    object oClicker = GetClickingObject();

    if (GetLocalInt(GetModule(), "X2_ypattack") == 1)
    {
        FloatingTextStrRefOnCreature(85674, oClicker);
    }
    else
    {
        object oTarget = GetTransitionTarget(OBJECT_SELF);

        SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

        AssignCommand(oClicker,JumpToObject(oTarget));
    }
}
