//* when projection is over set this global to 1
void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_M4Q01TALK_PROJECTION",1)  ;
    ExecuteScript("M4Q01D07MORASCK1", OBJECT_SELF);
}
