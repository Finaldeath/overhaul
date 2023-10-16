//q1a1_open_cutdr
//When this door is openned - it will be ok for the kobolds to flee.
void main()
{
    SetLocalInt(GetArea(OBJECT_SELF), "nPCONSTAIRS", 0);
}
