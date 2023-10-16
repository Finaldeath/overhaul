// Deactivate the Judgement stone.
void main()
{
    object oLight = GetObjectByTag("ACADEMY_PHYLACT");

    AssignCommand(oLight,
        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
}
