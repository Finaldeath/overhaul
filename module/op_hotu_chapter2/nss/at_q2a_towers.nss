//Tower Area Transition
//at_q2a_towers
void main()
{
    object oClicker = GetClickingObject();
    object oTarget = GetTransitionTarget(OBJECT_SELF);

    SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

    AssignCommand(oClicker,JumpToObject(oTarget));

    //make sure the battle herald follows the PC
    object oHerald = GetObjectByTag("q2aherald");
    if (GetIsObjectValid(oHerald) == TRUE)
        AssignCommand(oHerald, JumpToObject(oTarget));
}
