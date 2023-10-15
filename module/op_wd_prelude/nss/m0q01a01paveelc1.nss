void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL",(GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL"))+1);
    SetLocalInt(OBJECT_SELF,"NW_L_CallingOut",TRUE);
}
