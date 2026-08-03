from pydantic import BaseModel


class LoginSchema(BaseModel):
    email: str
    password: str


class RegisterSchema(BaseModel):
    email: str
    full_name: str
    password: str
