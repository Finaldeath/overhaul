// Throne room trap. When activated:
// jump out anyone who is inside and jump in the victims

void main()
{
    object oEnter = GetEnteringObject();
    SetLocalInt(oEnter, "Q6F_INSIDE", 1); // flagging creature as inside
}
