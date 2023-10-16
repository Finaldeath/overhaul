// at_postbattle1
// Don't let the PC transition if the Battle has started..
void main()
{
    object oClicker = GetClickingObject();

    if (GetLocalInt(GetModule(), "X2_Bat1PCNoTransition") == 1)
        FloatingTextStrRefOnCreature(85674, oClicker);  //"This is not a good time to leave this area!"
    else
    {

        object oTarget = GetTransitionTarget(OBJECT_SELF);

        SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

        AssignCommand(oClicker,JumpToObject(oTarget));
    }
}
