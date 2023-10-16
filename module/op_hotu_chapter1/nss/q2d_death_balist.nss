//q2d_death_balist
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nCreateDebris") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nCreateDebris", 1);
    location lSelf = GetLocation(OBJECT_SELF);

    CreateObject(OBJECT_TYPE_PLACEABLE, "q2ddeadcannon", lSelf);
}
