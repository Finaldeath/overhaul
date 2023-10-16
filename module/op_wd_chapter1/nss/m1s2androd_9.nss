void main()
{
    SetLocalObject(GetModule(),"NW_G_M1S2Androd",OBJECT_SELF);
    SetLocalObject(GetArea(OBJECT_SELF),"NW_G_" + GetTag(OBJECT_SELF),OBJECT_SELF);
}
