# -*- mode: Dockerfile; -*-

# This program is free software: you can redistribute it and/or modify it
# under the terms of the Affero GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the Affero GNU General Public
# License for more details.
#
# You should have received a copy of the Affero GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

FROM alpine:3.9 AS build

MAINTAINER Naoya Yamashita (@conao3)

RUN apk update && apk upgrade
RUN apk add alpine-sdk

WORKDIR /opt
RUN git clone https://github.com/nurse/nkf.git

WORKDIR nkf
RUN make
RUN make install

##############################
FROM alpine:3.9

RUN apk update && apk upgrade

COPY --from=0 /usr/local /usr/local

CMD ["nkf"]
