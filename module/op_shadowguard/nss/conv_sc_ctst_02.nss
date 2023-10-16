void main()
{
    object oLight = GetNearestObjectByTag("PLAC_LIGHT");

    AssignCommand(oLight, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));

    DelayCommand(0.2, SetPlaceableIllumination(oLight, TRUE));
    DelayCommand(0.4, RecomputeStaticLighting(GetArea(OBJECT_SELF)));

    SetLocalInt(OBJECT_SELF, "N_CONST_ACTIVATED", 1);
}
