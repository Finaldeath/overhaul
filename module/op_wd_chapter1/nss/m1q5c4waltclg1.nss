int StartingConditional()
{
    object oDrawl = GetLocalObject(GetModule(),"NW_G_M1Q5C04Drawl");
    int bCondition = GetArea(oDrawl) == GetArea(OBJECT_SELF) &&
                     GetIsObjectValid(oDrawl) &&
                     !GetIsDead(oDrawl);
    return bCondition;
}
