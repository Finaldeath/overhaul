void main()
{
    object oChest = GetObjectByTag("hx_mimic");

    AssignCommand(oChest, PlayAnimation(ANIMATION_LOOPING_SPASM));
}
