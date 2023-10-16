void main()
{
    object oEntered = GetEnteringObject();
    object oGuard = GetNearestObjectByTag("NW_PG_GUARD");

    if (GetTag(oEntered) == "NW_PG_COMMANDER")
    {
        AssignCommand(oGuard,PlayAnimation(ANIMATION_FIREFORGET_SALUTE));
    }
}
