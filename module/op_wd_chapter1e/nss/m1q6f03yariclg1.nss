int StartingConditional()
{
	return GetLocalInt(OBJECT_SELF,"L_TALKTIMES") > 1 && GetLocalInt(GetModule(),"NW_G_M1Q6F3DoorOpen")== FALSE;
}
