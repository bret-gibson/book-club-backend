class ApplicationController < ActionController::Base
    def secret_key
        "-gV[koN<`]N(n=Aw4acpL?edrSOi26}w+.B4D8M;^%r+S(Yz2K$vwR3.=Q*nIA|"
    end
    
    #given a payload {user_id: ?} => token
    def encode(payload)
      JWT.encode(payload, secret_key, 'HS256')
    end
  
    #given a token "abc.123" => payload {user_id: ?}
    def decode(token)
      JWT.decode(token, "-gV[koN<`]N(n=Aw4acpL?edrSOi26}w+.B4D8M;^%r+S(Yz2K$vwR3.=Q*nIA|", true, {algorithm: "HS256"})[0]
    end
end
