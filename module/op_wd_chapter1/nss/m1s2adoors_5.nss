void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M1S2MaskClosed"))
     ActionCloseDoor(OBJECT_SELF);
}
