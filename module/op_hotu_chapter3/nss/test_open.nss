void main()
{
    object oChest = GetObjectByTag("hx_mimic");

    AssignCommand(oChest, PlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 3.0));
}
