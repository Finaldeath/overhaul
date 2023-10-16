// make zidan stop follow

void main()
{
    object oZidan = GetNearestObjectByTag("Q1_ZIDAN");
    SetLocalObject(oZidan, "Q1_FOLLOW", OBJECT_INVALID);
}
