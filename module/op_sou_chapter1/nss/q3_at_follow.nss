// set slave to follow

void main()
{
    SetLocalObject(OBJECT_SELF, "Q3_FOLLOW", GetPCSpeaker());
    SetLocalInt(OBJECT_SELF, "Q3_ALLOWED_TO_FOLLOW", 1);
    SetLocalInt(GetModule(), "X1_Q3GlendirFollowPC", 1);
}
